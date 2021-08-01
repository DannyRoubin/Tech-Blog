const newBlogHandler = async (event) => {
  event.preventDefault();

  const blog_title = document.querySelector("#blog_title").value.trim();

  const blog_body = document.querySelector("#blog_body").value.trim();

  if (blog_title && blog_body) {
    const response = await fetch(`/api/blog`, {
      method: "POST",
      body: JSON.stringify({ blog_title, blog_body }),
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      document.location.replace("/profile");
    } else {
      alert("Failed to create blog");
    }
  }
};

document
  .querySelector(".new-blog-form")
  .addEventListener("submit", newBlogHandler);
