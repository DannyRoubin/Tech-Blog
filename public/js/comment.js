const newFormHandler = async (event) => {
  event.preventDefault();

  const blogId = event.target.getAttribute("data-id");
  const comment = document.querySelector("#comment-desc").value.trim();

  if (comment) {
    const response = await fetch(`/api/comments`, {
      method: "POST",
      body: JSON.stringify({ comment, blogId }),
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      document.location.assign(`/api/blogs/${blogId}`);
    } else {
      alert("Failed to create comment");
    }
  }
};
