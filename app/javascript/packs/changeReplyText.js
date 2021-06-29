const changeReplyText = () => {
  const collapseLink = document.querySelectorAll('.collapse-link');
  if (collapseLink) {
    collapseLink.forEach((element) => {
    element.addEventListener('click', (event) => {
      if (element.innerHTML === 'Show replies') {
        element.innerHTML = 'Hide replies';
      } else {
        element.innerHTML = 'Show replies';
      }
    });
  });
  }
}

export { changeReplyText };
