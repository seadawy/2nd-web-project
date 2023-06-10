$(document).ready(function () {
    $('#cart').on('click', function (event) {
        event.preventDefault();
        $('.popup').toggleClass('is-visible');
    });
    $('#popup').on('click', function (event) {
        if ($(event.target).is('.popup')) {
            $(this).toggleClass('is-visible');
        }
    });
    // set the data source
    $("#search").keyup(function () {
        var name = $('#search').val();
        if (name != "") {
            $.ajax({
                type: "POST",
                url: "index.aspx/search",
                data: JSON.stringify({ val: name }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    var data = JSON.parse(res.d);
                    $("#UpdatePanel2").html(getListHtml(data));
                },
                error: function (xhr, textStatus, error) {
                    // code to handle the error
                }
            });
        }
    });
});
function getListHtml(data) {
    var html = "";
    if (data.length == 0) {
        $("#xxx").addClass("d-flex");
        $("#xxx").removeClass("d-none");
        return "";
    }
    // <!-- [item_id],[item_name],[price],[offer_price],[description],[item_img] -->
    for (var i = 0, x = 0; i < data.length; i++, x++) {
        var containerId = x;
        var image = data[i].item_img;
        var itemName = data[i].item_name;
        var itemPrice = data[i].price;
        var itemId = data[i].item_id;
        var template = `
        <li class="cards__item" id = "${containerId}"> <div class="card">
            <center><img width="273" src="content/products/${image}" class="card__image"></center>
            <div class="card__content"><div class="card__title">${itemName}<span>${itemPrice}$</span></div>
            <div class="number">
                <input name="ListView1$ctrl${containerId}$Quantity" id="ListView1_Quantity_${containerId}" class="quantity" placeholder="quantity" min="1" type="number">
                <span id="ListView1_RequiredFieldValidator1_${containerId}" class="d-none" style="visibility:hidden;">*</span>
            </div>
            <div class="d-flex Pbtncontain">
                <input type="submit" name="ListView1$ctrl${containerId}$AddCart" value="" id="ListView1_AddCart_${containerId}" class="btnCart form-control add_to_cart bright">
                <a href="product.aspx?id=${itemId}" class="btnCart form-control bleft">show</a>
            </div>
            </div>
        </li>`;
        html += template;
        $("#xxx").addClass("d-none");
    }
    return html;
}

function sendNotification(type, text) {
    let notificationBox = $(".notification-box");
    const alerts = {
        info: {
            icon: `<svg class="w-6 h-6 mr-2" xmlns = "http://www.w3.org/2000/svg" fill = "none" viewBox = "0 0 24 24" stroke = "currentColor" > <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg > `,
            color: "blue-500"
        },
        error: {
            icon: `<svg xmlns = "http://www.w3.org/2000/svg" class="w-6 h-6 mr-2" fill = "none" viewBox = "0 0 24 24" stroke = "currentColor" > <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg > `,
            color: "red-500"
        },
        warning: {
            icon: `<svg xmlns = "http://www.w3.org/2000/svg" class="w-6 h-6 mr-2" fill = "none" viewBox = "0 0 24 24" stroke = "currentColor" > <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg > `,
            color: "yellow-500"
        },
        success: {
            icon: `<svg xmlns = "http://www.w3.org/2000/svg" class="w-6 h-6 mr-2" fill = "none" viewBox = "0 0 24 24" stroke = "currentColor" > <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg > `,
            color: "green-500"
        }
    };
    let component = $(`<div class="d-flex items-center bg-${alerts[type].color} text-white text-sm font-bold px-3 rounded-md opacity-0 transform transition-all duration-500 mb-1" > ${alerts[type].icon} <p class="m-0">${text}</p></div > `);
    notificationBox.html(component);
    setTimeout(() => {
        component.removeClass("opacity-0");
        component.addClass("opacity-1");
    }, 1);
    setTimeout(() => {
        component.removeClass("opacity-1");
        component.addClass("opacity-0");
        component.css({ "margin": 0, "padding": 0 });
    }, 5000);
    setTimeout(() => {
        component.css({ "height": "0", "important": "true" });
    }, 5100);
    setTimeout(() => {
        component.remove();
    }, 5700);
}

function taps(evt, id) {
    var i, tabcontent, tablinks;
    tabcontent = $(".tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = $(".tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    evt.target.classList.add('active');
    document.getElementById(id).style.display = "flex";
}
