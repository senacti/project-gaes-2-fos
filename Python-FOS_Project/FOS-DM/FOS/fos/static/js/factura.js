document.getElementById("showIdentificationForm").addEventListener("click", function() {
    document.getElementById("identificationForm").style.display = "block";
    document.getElementById("shippingForm").style.display = "none";
    document.getElementById("paymentForm").style.display = "none";
});

document.getElementById("showShippingForm").addEventListener("click", function() {
    document.getElementById("identificationForm").style.display = "none";
    document.getElementById("shippingForm").style.display = "block";
    document.getElementById("paymentForm").style.display = "none";
});

document.getElementById("showPaymentForm").addEventListener("click", function() {
    document.getElementById("identificationForm").style.display = "none";
    document.getElementById("shippingForm").style.display = "none";
    document.getElementById("paymentForm").style.display = "block";
});