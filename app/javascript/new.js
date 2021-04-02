function sample(){
  const inputPrice = document.getElementById('item-price')
  inputPrice.addEventListener("input", () => {
    const itemPrice = inputPrice.value;
    const addTaxPrice = document.getElementById('add-tax-price')
    const profit = document.getElementById('profit')
    const taxPrice = Math.floor(itemPrice*0.1)
    addTaxPrice.innerHTML = taxPrice
    profit.innerHTML = itemPrice - taxPrice
  })
}

window.addEventListener('load', sample)
