const form = document.getElementById("reviewForm");
const container = document.getElementById("reviewContainer");

if (form) {
    form.addEventListener("submit", async function (e) {
        e.preventDefault();

        const rating = document.querySelector('input[name="rating"]:checked');

        if (!rating) {
            alert("Please select rating");
            return;
        }

        const review = {
            name: document.getElementById("name").value,
            message: document.getElementById("message").value,
            rating: parseInt(rating.value)
        };

        try {
            const res = await fetch("http://localhost:5000/api/reviews", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(review)
            });

            alert("Review submitted!");
            form.reset();
            loadReviews();

        } catch (err) {
            console.error("Error:", err);
        }
    });
}

async function loadReviews() {
    try {
        const res = await fetch("http://localhost:5000/api/reviews");
        const reviews = await res.json();
        container.innerHTML = "";

        if (reviews.length === 0) {
            container.innerHTML = "<p>No reviews yet.</p>";
            return;
        }

        reviews.forEach(r => {
            let stars = "⭐".repeat(r.rating);

            container.innerHTML += `
                <div class="review">
                    <h3>${r.name}</h3>
                    <p>${r.message}</p>
                    <div class="stars">${stars}</div>
                </div>
            `;
        });

    } catch (err) {
        console.error("Load error:", err);
    }
}

if (container) {
    loadReviews();
}