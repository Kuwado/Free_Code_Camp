document.getElementById('check-btn').addEventListener('click', function() {
    let inputTextFirst = document.getElementById('text-input').value;
    let inputText = inputTextFirst.toLowerCase().replace(/[^a-z0-9]/g, '')
    if (inputText === '') {
        alert('Please input a value');
    } else {
        let resultDiv = document.getElementById('result');
        if (isPalindrome(inputText)) {
            resultDiv.textContent = inputTextFirst + ' is a palindrome';
        } else {
            resultDiv.textContent = inputTextFirst + ' is not a palindrome';
        }
        resultDiv.classList.remove('hidden');
    }
});

function isPalindrome(str) {
    let left = 0;
    let right = str.length - 1;
    if (str.length === 1)
        return true;
    while (left < right) {
        if (str[left] !== str[right]) {
            return false;
        }
        left++;
        right--;
    }
    return true;
}
