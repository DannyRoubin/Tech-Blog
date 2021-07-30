const newFormHandler = async (event) => {
  event.preventDefault();
  const blogId = document.getElementById("submitbtn").getAttribute("data-id");

  const comment = document.querySelector("#comment-desc").value.trim();

  console.log(blogId);
  console.log(comment);

  //   if (comment) {
  //     const response = await fetch(`/api/comments`, {
  //       method: "POST",
  //       body: JSON.stringify({ comment, blogId }),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     });

  //     if (response.ok) {
  //       document.location.assign(`/api/blogs/${blogId}`);
  //     } else {
  //       alert("Failed to create comment");
  //     }
  //   }
};

document
  .querySelector(".new-comment-form")
  .addEventListener("submit", newFormHandler);
