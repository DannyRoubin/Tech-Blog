const router = require("express").Router();
const userRoutes = require("./userRoutes");
const blogRoutes = require("./BlogRoutes");
const commentRoutes = require("./commentRoutes");
const updateRoutes = require("./updateRoutes");

router.use("/users", userRoutes);
router.use("/blog", blogRoutes);
router.use("/comment", commentRoutes);
router.use("/update", updateRoutes);

module.exports = router;
