const convertBTN = document.querySelector("#convert-btn");
const input = document.querySelector("#number");
const output = document.querySelector("#output");

const M1 = "Please enter a valid number";
const M2 = "Please enter a number greater than or equal to 1";
const M3 = "Please enter a number less than or equal to 3999";

var ans = "";
var table = []; // Sửa cú pháp khai báo mảng

function addTable() {
    table[1] = ["M", 1000]; // Thêm dữ liệu vào mảng
    table[2] = ["CM", 900];
    table[3] = ["D", 500];
    table[4] = ["CD", 400];
    table[5] = ["C", 100];
    table[6] = ["XC", 90];
    table[7] = ["L", 50];
    table[8] = ["XL", 40];
    table[9] = ["X", 10];
    table[10] = ["IX", 9];
    table[11] = ["V", 5];
    table[12] = ["IV", 4];
    table[13] = ["I", 1];
}

addTable(); // Gọi hàm addTable để khởi tạo mảng table

convertBTN.addEventListener("click", function(){
    var value = input.value;
    if (!output.classList.contains("output-active")) {
        output.classList.add("output-active");
    }
    if (value === "") {
        output.innerHTML = M1;
    } else if (value <= 0) {
        output.innerHTML = M2;
    } else if (value >= 4000) {
        output.innerHTML = M3;
    } else {
        change(value); // Gọi hàm change khi số nhập vào hợp lệ
        output.innerHTML = ans;
    }
});

function change(number) {
    ans = "";
    for (var i = 1; i <= 13; i++) {
        while (number - table[i][1] >= 0) {
            number -= table[i][1];
            ans += table[i][0];
        }
    }
}
