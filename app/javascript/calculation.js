window.addEventListener('input', function(){

  const itemPrice = document.getElementById("item-price").value;
  const taxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  const tax = 10
  const taxExcluded = 0.9

  value = itemPrice;
  sum1 = value / tax;
  afterTax = Math.floor(sum1);
  sum2 = value * taxExcluded;
  beforeTax = Math.floor(sum2);
  
  taxPrice.innerHTML = afterTax;
  Profit.innerHTML = beforeTax;
})