const newFormHandler = async (event) => {
  event.preventDefault();

  const blogId = event.target.getAttribute("data-id");
  const comment = document.querySelector("#blog-desc").value.trim();

  if (name && description) {
    const response = await fetch(`/api/blogs`, {
      method: "POST",
      body: JSON.stringify({ name, description }),
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
