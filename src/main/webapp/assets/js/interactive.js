function offset(element) {
    let left = element.offsetLeft + element.offsetParent.offsetLeft
    let top = element.offsetTop + element.offsetParent.offsetTop
    return { left, top };
}

document.addEventListener("DOMContentLoaded", function(event) {

    function getRadius() {
        let radius = radiusElement.value.replaceAll(',', '.')
        if (isNaN(parseFloat(radius))) {
            throw new Error('Для того, чтобы взаимодействовать с элементом, необходимо ввести радиус')
        }
        if (parseFloat(radius) < 2 || parseFloat(radius) > 5) {
            throw new Error('Радиус должен быть в указанном диапазоне')
        }
        return radius
    }

    let addPoint = (x, y) => {
        let dot = document.createElement('div')
        dot.classList.add('task-image--dot')
        dot.style.left = x + 'px'
        dot.style.top = y + 'px'
        wrapper.append(dot)
    }

    wrapper.addEventListener('click', function (e) {

        let windowPositionX = e.pageX - offset(wrapper).left
        let windowPositionY = e.pageY - offset(wrapper).top
        try {
            let radius = getRadius();
            let x = (windowPositionX / (WINDOW_SIZE / 2) - 1) * SCALABLE_COEFFICIENT * radius
            let y = (-windowPositionY / (WINDOW_SIZE / 2) + 1) * SCALABLE_COEFFICIENT * radius

            addPoint(windowPositionX, windowPositionY)

            xElement.value = x.toFixed(3)
            yElement.value = y.toFixed(3)
            radiusElement.value = radius
            interactiveElement.value = 'plain'
            swal("Точка успешно добавлена")
                .then(() => {
                    form.submit()
                });

        } catch (e) {
            swal("Ошибка", e.message, "error");
        }
    })

    initPoints();

});