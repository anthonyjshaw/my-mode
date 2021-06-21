
const addActiveClassNav = () => {
  const page = window.location.href;
  const active = document.getElementById('home-active');
  const navLinks = document.querySelectorAll('.nav-link');
  const isLink = ['my-styles']
  navLinks.forEach((element) => {
    const link = element.href;
    if (page === link) {
          element.classList.add('active');
    }
  })
}

export { addActiveClassNav };
