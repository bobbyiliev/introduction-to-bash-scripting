<?php

return [
    /**
     * The book title.
     */
    'title' => 'Introduction to Bash Scripting',

    /**
     * The author name.
     */
    'author' => 'Bobby Iliev',

    /**
     * CSS inline style for the page header.
     * If you want to skip header, comment the line
     */
    'header' => 'font-style: italic; text-align: right; border-bottom: solid 1px #808080;',

    /**
     * Cover page image configuration.
     */
    'cover' => [
        'position' => 'position: absolute; left:0; right: 0; top: -.2; bottom: 0;',
        'dimensions' => 'width: 210mm; height: 297mm; margin: 0;',
        'image' => 'cover.jpg',
    ],

    /**
     * The list of fonts to be used in the different themes.
     */
    'fonts' => [
        //        'calibri' => 'Calibri-Regular.ttf',
        //        'times' => 'times-regular.ttf',
    ],

    /**
     * Page ranges to be used with the sample command.
     */
    'sample' => [
        [1, 35]
    ],

    /**
     * A notice printed at the final page of a generated sample.
     */
    'sample_notice' => 'This is a sample from "Introduction to Bash Scripting" by Bobby Iliev. <br>
                        For more information, <a href="https://bobbyiliev.com/">Click here</a>.',
];
