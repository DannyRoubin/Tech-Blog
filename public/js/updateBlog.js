const updateBlogHandler = async (event) => {
  event.preventDefault();

  const blog_title = document.querySelector("#blog_title").value.trim();
  const blog_body = document.querySelector("#blog_body").value.trim();

  if (event.target.hasAttribute("data-id")) {
    const id = event.target.getAttribute("data-id");

    const response = await fetch(`/api/update/${id}`, {
      method: "PUT",
      body: JSON.stringify({ blog_title, blog_body }),
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      document.location.replace("/profile");
    } else {
      alert("There was an error updating your blog, please try again");
    }
  }
};

const deleteBlogHandler = async (event) => {
  event.preventDefault();

  if (event.target.hasAttribute("data-id")) {
    const id = event.target.getAttribute("data-id");

    const response = await fetch(`/api/update/${id}`, {
      method: "DELETE",
    });

    if (response.ok) {
      document.location.replace("/profile");
    } else {
      alert("There was an error deleting your blog, please try again");
    }
  }
};

const cancelBtnHandler = async (event) => {
  event.preventDefault();
  if (event.target.hasAttribute("data-id")) {
    document.location.replace("/profile");
  }
};

document
  .querySelector("#updatebtn")
  .addEventListener("click", updateBlogHandler);

document
  .querySelector("#deletebtn")
  .addEventListener("click", deleteBlogHandler);

document
  .querySelector("#cancelbtn")
  .addEventListener("click", cancelBtnHandler);
