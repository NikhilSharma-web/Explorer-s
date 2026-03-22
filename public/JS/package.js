const params = new URLSearchParams(window.location.search);
const place = params.get("place");

if (place) {
    fetch(`/api/packages/${place.toLowerCase()}`)
        .then(res => res.json())
        .then(data => {

            if (!data.length) {
                document.getElementById("packageTitle").innerText = "Package Not Found";
                return;
            }

            document.getElementById("packageTitle").innerText =
                data[0].name + " Packages";

            document.getElementById("packageImage").src =
                data[0].image;

            const container = document.getElementById("packageList");
            container.innerHTML = "";

            data.forEach(pkg => {

                const card = document.createElement("div");
                card.classList.add("package-card");

                let includesHTML = "";

                pkg.includes.forEach(day => {
                    includesHTML += `
                        <div class="day-plan">
                            <strong>${day.day}</strong>
                            <p>${day.activity}</p>
                        </div>
                    `;
                });

                card.innerHTML = `
                    <div class="card-header">
                        <h3>${pkg.title}</h3>
                        <span class="price">₹${pkg.price}</span>
                    </div>

                    <p class="duration">${pkg.duration}</p>

                    <div class="day-container">
                        ${includesHTML}
                    </div>                
                `;

                container.appendChild(card);
            });

        })
        .catch(err => {
            console.error(err);
        });
}