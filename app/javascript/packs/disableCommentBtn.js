const disableCommentBtn = () => {

  const commentContent = document.getElementById('comment_content');
  const commentSubmitBtn = document.getElementById('comment-submit-button')
  if (commentContent) {
    commentContent.addEventListener('keyup', (event) => {
      if (commentContent.value === '') {
        commentSubmitBtn.setAttribute('disabled', '');
      } else {
        commentSubmitBtn.disabled = false;
      }
    });
  }

}

export { disableCommentBtn }
