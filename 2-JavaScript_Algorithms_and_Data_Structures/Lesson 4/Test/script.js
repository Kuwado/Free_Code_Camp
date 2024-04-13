const purchaseBtn = document.querySelector("#purchase-btn");
const changeDue = document.querySelector("#change-due");
const drawer = document.querySelector("#drawer");
const total = document.querySelector("#total");
const cashInput = document.querySelector("#cash");

let stt = "OPEN";
let price = 3.26;
let check = true;
let cid = [
    ["PENNY", 1.01],
    ["NICKEL", 2.05],
    ["DIME", 3.1],
    ["QUARTER", 4.25],
    ["ONE", 90],
    ["FIVE", 55],
    ["TEN", 20],
    ["TWENTY", 60],
    ["ONE HUNDRED", 100]
];

let money = [
    ["PENNY", 0.01],
    ["NICKEL", 0.05],
    ["DIME", 0.1],
    ["QUARTER", 0.25],
    ["ONE", 1],
    ["FIVE", 5],
    ["TEN", 10],
    ["TWENTY", 20],
    ["ONE HUNDRED", 100]
];

let result = [
    ["PENNY", 0],
    ["NICKEL", 0],
    ["DIME", 0],
    ["QUARTER", 0],
    ["ONE", 0],
    ["FIVE", 0],
    ["TEN", 0],
    ["TWENTY", 0],
    ["ONE HUNDRED", 0]
];

function addTotal() {
    const p = document.createElement("p");
    p.textContent = "Total: $" + price.toFixed(2); 
    total.appendChild(p);
}

function addDrawer() {
    while (drawer.firstChild) {
        drawer.removeChild(drawer.firstChild); 
    }
    const title = document.createElement("p");
    title.textContent = "Change in drawer:";
    drawer.appendChild(title);
    for (let i = 0; i < cid.length; i++) {
        const [type, amount] = cid[i];
        const value = parseFloat(amount.toFixed(2));
        const p = document.createElement("p");
        p.textContent = type + ": $" + value;
        drawer.appendChild(p);
    }
}

function addChangeDue() {
    while (changeDue.firstChild) {
        changeDue.removeChild(changeDue.firstChild); 
    }
    const title = document.createElement("p");
    title.textContent = "Status: " + stt;
    changeDue.appendChild(title);
    for (let i = result.length - 1; i >= 0; i--) {
        const [type, amount] = result[i];
        const value = parseFloat(amount.toFixed(2));
        if (value > 0) {
            const p = document.createElement("p");
            p.textContent = type + ": $" + value;
            changeDue.appendChild(p);
        }
    }
}

purchaseBtn.addEventListener("click", function(){
    let cash = parseFloat(cashInput.value).toFixed(2);
    let change = cash - price;
    if (change === 0) {
        const p = document.createElement("p");
        p.textContent = "No change due - customer paid with exact cash";
        changeDue.appendChild(p);
    } else 
        if (change < 0) {
            alert("Customer does not have enough money to purchase the item");
        } else {
            calculate(change);
            if (!check) {
                while (changeDue.firstChild) {
                    changeDue.removeChild(changeDue.firstChild); 
                }
                const e = document.createElement("p");
                e.textContent = "Status: INSUFFICIENT_FUNDS";
                changeDue.appendChild(e);
            }
            else {
                addStt();
                addChangeDue();
                addDrawer();
            }
        }
});

function calculate(change) {
    const pre = cid;
    check = true;
    for (let i = money.length - 1; i >= 0; i--) {
        if (change === 0) return;
        result[i][1] = 0;
        const [type, amount] = money[i];
        const value = parseFloat(amount.toFixed(2));
        while (change >= value && cid[i][1] >= value) {
            change -= value;
            change = parseFloat(change.toFixed(2));
            const val = cid[i][1] - value;
            const vall = parseFloat(val.toFixed(2));
            cid[i][1] = vall;
            result[i][1] += value;
        }
    }
    if (change > 0) {
        cid = pre;
        check = false;
    }
}

function addStt() {
    let c = true;
    for (let i = 0; i < cid.length; i++) {
        if (cid[i][1] > 0) {
            c = false;
            break;
        }
    }
    if (!c) stt = "OPEN";
    else stt = "CLOSED";
}

addTotal();
addDrawer();
