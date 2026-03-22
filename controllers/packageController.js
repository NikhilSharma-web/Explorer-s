import { getPackageBySlug } from "../models/packageModel.js";

export const getPackages = async (req, res) => {
    const slug = req.params.slug.toLowerCase();

    try {
        const data = await getPackageBySlug(slug);

        if (!data) {
            return res.status(404).json({ message: "Package not found" });
        }

        res.json(data);  // ✅ yaha fix hai
    } catch (err) {
        console.error("DB ERROR:", err);
        res.status(500).json({ message: "Server error" });
    }
};