// Set current year if #year element exists
var year = new Date().getFullYear();
console.log(year);
if (document.getElementById("year")) {
    document.getElementById("year").innerHTML = year;
}

// Mobile navigation toggle button
if (document.getElementById('nav-mobile-btn')) {
    document.getElementById('nav-mobile-btn').addEventListener('click', function () {
        if (this.classList.contains('close')) {
            document.getElementById('nav').classList.add('hidden');
            this.classList.remove('close');
        } else {
            document.getElementById('nav').classList.remove('hidden');
            this.classList.add('close');
        }
    });
}
