const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/views/**/*.{erb,haml,html,slim}",
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Inter var", ...defaultTheme.fontFamily.sans],
                poppins: ["Poppins", "sans-serif"],
            },
            backgroundColor: {
                mainColor1: "#293437",
                mainColor2: "#459F98",
            },
            colors: {
                mainColor1: "#293437",
                mainColor2: "#459F98",
            },
            animationDuration: {
                "2s": "2s",
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
        require("tailwindcss-animate"),
    ],
};
