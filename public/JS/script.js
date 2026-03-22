document.addEventListener("DOMContentLoaded", function () {
    // FOOTER LOAD
    fetch("/footer.html")
        .then(res => res.text())
        .then(data => {
            const footer = document.getElementById("footer");
            if (footer) footer.innerHTML = data;
        })
        .catch(err => console.error(err));

    // NAVBAR LOAD

    // Navbar elements (load hone ke baad select karna)
    const destination = document.getElementById("destinationLink");
    const dropdownMenu = document.querySelector(".dropdown-menu");
    const arrow = document.querySelector(".arrow");
    const hamBurger = document.querySelector(".hamburger");
    const navLinks = document.querySelector(".nav-links");

    // DROPDOWN
    if (destination && dropdownMenu && arrow) {

        destination.addEventListener("click", function (e) {
            e.preventDefault();
            dropdownMenu.classList.toggle("show");
            arrow.classList.toggle("rotate");
        });

        document.addEventListener("click", function (e) {
            if (!destination.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.classList.remove("show");
                arrow.classList.remove("rotate");
            }
        });

    }

    // HAMBURGER MENU
    if (hamBurger && navLinks) {
        hamBurger.addEventListener("click", () => {
            navLinks.classList.toggle("active");
        });
    }

    // ACTIVE NAV LINK
    // ACTIVE NAV LINK
    const currentPath = window.location.pathname;

    document.querySelectorAll(".nav-links a").forEach(link => {

        // "#" wale links ignore karo
        if (link.getAttribute("href") === "#") return;

        const linkPath = new URL(link.href).pathname;

        if (linkPath === currentPath) {
            link.style.color = "orange";
        }
        
    });
    
})

// CONTACT FORM
const contactForm = document.querySelector("#contactForm");

if (contactForm) {

    contactForm.addEventListener("submit", async function (e) {

        e.preventDefault();

        const button = document.getElementById("submitBtn");
        const btnText = document.querySelector(".btn-text");
        const spinner = document.querySelector(".spinner");

        const name = document.querySelector("#name").value.trim();
        const email = document.querySelector("#email").value.trim();
        const phone = document.querySelector("#phone").value.trim();
        const message = document.querySelector("#message").value.trim();

        if (!name || !email || !phone || !message) {
            alert("Please fill all fields");
            return;
        }

        btnText.innerText = "Sending...";
        spinner.style.display = "inline-block";
        button.disabled = true;

        try {

            await new Promise(res => setTimeout(res, 2000));

            const response = await fetch("/api/contact", {

                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ name, email, phone, message })

            });

            const data = await response.json();

            if (response.ok) {

                alert("Message Sent Successfully");
                contactForm.reset();

            } else {

                alert(data.message);

            }

        }
        catch (error) {

            alert("Something went wrong");
            console.error(error);

        }
        finally {

            btnText.innerText = "Send Message";
            spinner.style.display = "none";
            button.disabled = false;

        }

    });

}

// WHATSAPP AUTO MESSAGE
// const whatsappLink = document.querySelector(".whatsapp-float");

// if (whatsappLink) {

//     const params = new URLSearchParams(window.location.search);
//     const place = params.get("place");

//     let message;

//     if (place) {

//         message = `Hello I am interested in ${place} tour package. Can I get more info and details about the package?`;

//     }
//     else {

//         message = `Hello I was looking for a tour package. Can I get more details?`;

//     }

//     whatsappLink.href = `https://wa.me/916297142056?text=${encodeURIComponent(message)}`;

// }
const whatsappLink = document.querySelector(".whatsapp-float");

if (whatsappLink) {

    const params = new URLSearchParams(window.location.search);
    const place = params.get("place");

    let message;

    if (place) {
        message = `Hello I am interested in ${place} tour package. Can I get more info and details about the package?`;
    } else {
        message = `Hello I was looking for a tour package. Can I get more details?`;
    }

    whatsappLink.addEventListener("click", function(e) {
        e.preventDefault(); // important 🔥

        const url = `https://wa.me/916297142056?text=${encodeURIComponent(message)}`;
        window.open(url, "_blank");
    });

}