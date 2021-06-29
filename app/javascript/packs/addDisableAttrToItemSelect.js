const addDisableAttrToItemSelect = () => {
  const styleItems = document.querySelectorAll('.style-item-category')
  if (styleItems) {
    styleItems.forEach((element) => {
      const selectOption = document.querySelector(`option[value=${element.dataset.category}]`)
      if (selectOption) {
        if (selectOption.innerText === element.dataset.category) {
          selectOption.setAttribute('disabled', '')
        }
      }
    })
  }
}

export { addDisableAttrToItemSelect }
