
const addActiveClassNav = () => {
  const page = window.location.href
  const navLinks = document.querySelectorAll('.nav-link')
  navLinks.forEach((element) => {
    const link = element.href
    if (page === link) {
      element.classList.add('active')
    }
  })
}

export { addActiveClassNav }
