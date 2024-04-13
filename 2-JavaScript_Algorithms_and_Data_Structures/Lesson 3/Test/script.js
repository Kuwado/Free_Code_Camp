const number = document.querySelector("#user-input");
const checkBTn = document.querySelector("#check-btn");
const clearBTN = document.querySelector("#clear-btn");
const result = document.querySelector("#results-div");

const regex = /^(1\s?)?(\(\d{3}\)|\d{3})[\s-]?\d{3}[\s-]?\d{4}$/;
const validText = "Valid US number:";
const invalidText = "Invalid US number:";

checkBTn.addEventListener("click", function(){
    var sdt = number.value;
    if (sdt === "") {
        alert("Please provide a phone number");
    } else {
        if (regex.test(sdt)) {
            addResult(sdt, validText);
        }
        else addResult(sdt, invalidText);
    }
});

function addResult(number, text) {
    const pElement = document.createElement("p");
    pElement.textContent = text + " " + number;
    pElement.classList.add("results-text");
    result.appendChild(pElement);
}

clearBTN.addEventListener("click", function(){
    while (result.firstChild) {
        result.removeChild(result.firstChild);
    }
});