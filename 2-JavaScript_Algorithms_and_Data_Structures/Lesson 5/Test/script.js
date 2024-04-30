const nameP = document.getElementById("pokemon-name");
const id = document.getElementById("pokemon-id");
const weight = document.getElementById("weight");
const height = document.getElementById("height");
const types = document.getElementById("types");
const imageElement = document.getElementById("sprite"); // Thay đổi tên biến để tránh xung đột với thuộc tính src
const hp = document.getElementById("hp");
const atk = document.getElementById("attack");
const def = document.getElementById("defense");
const satk = document.getElementById("special-attack");
const sdef = document.getElementById("special-defense");
const sp = document.getElementById("speed");
const searchBtn = document.getElementById("search-button");
const text = document.querySelector("#search-input");
const detail = document.getElementById("detail");
let stt = false;

function fetchPokemon(input) {
    const path = "https://pokeapi-proxy.freecodecamp.rocks/api/pokemon/" + input;
    fetch(path)
    .then(response => {
        if (!response.ok) {
            alert("Pokémon not found");
        }
        return response.json();
    })
    .then(data => {
        displayPokemon(data);
    })
    .catch(error => {
        displayErrorMessage(error.message);
    })
}

function displayPokemon(pokemon) {
    nameP.textContent = pokemon.name.toUpperCase();
    id.textContent = `#${pokemon.id}`;
    weight.textContent = `Weight: ${pokemon.weight}`; // Sử dụng template literals
    height.textContent = `Height: ${pokemon.height}`; // Sử dụng template literals
    hp.textContent = pokemon.stats[0].base_stat;
    atk.textContent = pokemon.stats[1].base_stat;
    def.textContent = pokemon.stats[2].base_stat;
    satk.textContent = pokemon.stats[3].base_stat;
    sdef.textContent = pokemon.stats[4].base_stat;
    sp.textContent = pokemon.stats[5].base_stat;
    imageElement.src = pokemon.sprites.front_default; // Gán đường dẫn ảnh cho thuộc tính src
    const typeList = pokemon.types;
    while (types.firstChild) {
        types.removeChild(types.firstChild);
    }
    pokemon.types.forEach(t => {
        const typeElement = document.createElement("span");
        typeElement.textContent = t.type.name.toUpperCase();
        typeElement.classList.add("type");
        typeElement.classList.add(t.type.name); // Thêm class dựa trên giá trị của biến t.type.name
        types.appendChild(typeElement); // Thêm phần tử span vào phần tử types
    });
    detail.classList.add("detail-active");
    stt = true;
}

function displayErrorMessage(message) {
    const errorMessage = document.createElement("p");
    errorMessage.textContent = message;
    errorMessage.classList.add("error");
    document.body.appendChild(errorMessage);
    setTimeout(() => {
        errorMessage.remove();
    }, 3000);
}

searchBtn.addEventListener("click", function(event){
    event.preventDefault();
    let nameInput = text.value.toLowerCase();
    fetchPokemon(nameInput);
});
