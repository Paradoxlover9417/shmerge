const apiURI = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=da4603f53841f686a880e30aa9432e68"

$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(data) {
        var weathericonUrl =
            '<img src= "http://openweathermap.org/img/wn/'
            + data.weather[0].icon +
            '.png" alt="' + data.weather[0].description + '"/>'

        $('.weather_icon').html(weathericonUrl);
        $('.weather_temp').append(Math.round(data.main.temp - 273.15) + '°C');
    }
})