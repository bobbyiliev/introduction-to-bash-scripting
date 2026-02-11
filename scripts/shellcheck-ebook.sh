#!/bin/bash
#
# Extract bash code blocks from the English ebook
# markdown files and run shellcheck on each one.
#
# Usage:
#   ./scripts/shellcheck-ebook.sh [ebook_dir]
#
# Arguments:
#   ebook_dir  Path to the ebook content directory (default: ebook/en/content)
#
# Exit codes:
#   0  All code blocks pass shellcheck
#   1  One or more code blocks have shellcheck warnings
#

set -euo pipefail

EBOOK_DIR="${1:-ebook/en/content}"

if [[ ! -d "$EBOOK_DIR" ]]; then
    echo "Error: directory '$EBOOK_DIR' not found"
    exit 1
fi

# Shellcheck codes to exclude for code snippets:
#   SC2034 - variable appears unused (snippets define vars used in later snippets)
#   SC2154 - variable referenced but not assigned (same reason)
#   SC2145 - argument mixes string and array (educational $@ examples)
#   SC2078 - constant expression (placeholder names like test_case_1)
#   SC2043 - loop will only run once (deliberate bad-example demonstrations)
#   SC2211 - glob used as command (crontab syntax lines)
EXCLUDE="SC2034,SC2154,SC2145,SC2078,SC2043,SC2211"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

total=0
failed=0
skipped=0
failures=""

for md_file in "$EBOOK_DIR"/*.md; do
    filename=$(basename "$md_file")
    in_block=false
    block_num=0
    block_content=""
    last_text_line=""

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Strip carriage returns (some files have CRLF endings)
        line="${line//$'\r'/}"

        if [[ "$in_block" == false ]]; then
            # Track last non-empty line before code blocks so we can
            # detect headings like "**Incorrect:**" or "### Error:"
            if [[ -n "$line" ]] && [[ ! "$line" =~ ^\`\`\` ]]; then
                last_text_line="$line"
            fi

            if [[ "$line" =~ ^\`\`\`bash ]]; then
                in_block=true
                block_content=""
            fi
            continue
        fi

        # Inside a code block
        if [[ "$line" =~ ^\`\`\` ]]; then
            in_block=false
            block_num=$((block_num + 1))

            # Skip blocks that are deliberately broken examples.
            # These appear after headings like "**Incorrect:**" or "### Error:"
            if [[ "$last_text_line" =~ [Ii]ncorrect ]] || \
               [[ "$last_text_line" =~ ^###\ Error ]] || \
               [[ "$last_text_line" =~ [Oo]utput ]]; then
                skipped=$((skipped + 1))
                continue
            fi

            # Skip blocks containing placeholder syntax that is not real bash
            if [[ "$block_content" == *"<commands>"* ]] || \
               [[ "$block_content" == *"<^>"* ]] || \
               [[ "$block_content" =~ \[n\] ]]; then
                skipped=$((skipped + 1))
                continue
            fi

            # Skip crontab lines and select-menu output (not runnable bash)
            first_line="${block_content%%$'\n'*}"
            if [[ "$first_line" =~ ^[*0-9]+[[:space:]]+[*0-9]+[[:space:]]+[*0-9] ]] || \
               [[ "$first_line" =~ ^[0-9]+\) ]]; then
                skipped=$((skipped + 1))
                continue
            fi

            total=$((total + 1))

            # Write block to a temp file with a shebang
            block_file="$tmpdir/${filename}_block_${block_num}.sh"
            printf '#!/bin/bash\n%s\n' "$block_content" > "$block_file"

            # Run shellcheck
            if ! output=$(shellcheck -S warning -e "$EXCLUDE" "$block_file" 2>&1); then
                failed=$((failed + 1))
                failures+="
--- ${filename} block ${block_num} ---
${output}
"
            fi
            continue
        fi

        if [[ -z "$block_content" ]]; then
            block_content="$line"
        else
            block_content+=$'\n'"$line"
        fi
    done < "$md_file"
done

file_count=$(find "$EBOOK_DIR" -name '*.md' -maxdepth 1 | wc -l | tr -d ' ')
echo "Checked ${total} bash code blocks across ${file_count} markdown files (${skipped} skipped)."

if [[ "$failed" -gt 0 ]]; then
    echo "${failed} block(s) have shellcheck warnings:"
    echo "$failures"
    exit 1
else
    echo "All blocks pass shellcheck."
    exit 0
fi
