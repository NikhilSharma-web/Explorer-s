import express from "express";
import path from "path";
import dotenv from "dotenv";
import { fileURLToPath } from "url";

import contactRoutes from "./routes/contactRoutes.js";
import packageRoutes from "./routes/packageRoutes.js";
import reviewRoutes from "./routes/reviewRoutes.js"

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Fix __dirname for ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// API Routes
app.use("/api", contactRoutes)
app.use("/api/packages", packageRoutes)
app.use("/api/reviews", reviewRoutes)

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "index.html"));
});

app.get("/package", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "package.html"));
});

app.get("/about", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "about.html"));
});

app.get("/contact", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "contact.html"));
});
app.get("/review", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "review.html"));
});


app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});