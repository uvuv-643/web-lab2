let form = document.querySelector('#check-point-in-area')
let root = document.querySelector('#root')
let xElement, yElement, radiusElement, buttons, buttonSubmit, prev
let xError, yError, rError

const wrapper = document.querySelector('.task-image--wrapper')
const interactiveElement = document.getElementById('interactive')
const SCALABLE_COEFFICIENT = 1.25
const WINDOW_SIZE = wrapper.clientWidth

let initPoints = () => {
    let points = document.querySelectorAll('.task-image--dot')
    points.forEach((point) => {
        let x = point.getAttribute('data-x')
        let y = point.getAttribute('data-y')
        let radius = point.getAttribute('data-r')

        let positionX = (WINDOW_SIZE / 2) * (x / (SCALABLE_COEFFICIENT * radius) + 1)
        let positionY = (WINDOW_SIZE / 2) * (-y / (SCALABLE_COEFFICIENT * radius) + 1)

        point.style.left = positionX + 'px'
        point.style.top = positionY + 'px'
    })
}

document.addEventListener("DOMContentLoaded", function(event) {
    xError = document.querySelector('.x-error')
    yError = document.querySelector('.y-error')
    rError = document.querySelector('.r-error')
    xElement = document.getElementById('x')
    yElement = document.getElementById('y')
    radiusElement = document.getElementById('radius')
    buttons = document.querySelectorAll('*[data-trigger="input-buttons"] > button')
    buttonSubmit = document.querySelector('*[data-trigger="input-submit"] > button')
    prev = document.querySelectorAll('#result-table tbody tr')

    function isPointInArea() {
        let pointData = {
            x: xElement.value.replaceAll(',', '.'),
            y: yElement.value.replaceAll(',', '.'),
            r: radiusElement.value.replaceAll(',', '.'),
        }
        let errors = []
        if (isNaN(parseFloat(pointData.x))) errors.push(xError)
        if (isNaN(parseFloat(pointData.y)) || parseFloat(pointData.y) < -5 || parseFloat(pointData.y) > 3) errors.push(yError)
        if (isNaN(parseFloat(pointData.r)) || parseFloat(pointData.r) < 2 || parseFloat(pointData.r) > 5) errors.push(rError)
        if (errors.length) throw errors

    }

    yElement?.addEventListener('input', () => {
        yError.classList.remove('_active')
        localStorage.setItem('y', yElement.value)
    })
    radiusElement?.addEventListener('input', () => {
        rError.classList.remove('_active')
        localStorage.setItem('radius', radiusElement.value)
    })

    root?.addEventListener('click', (e) => {
        if (e.target.classList.contains('task-input__button--x')) {
            xError.classList.remove('_active')
            xElement.value = e.target.getAttribute('data-value')
            buttons.forEach((button) => {
                button.classList.remove('_active')
            })
            e.target.classList += ' _active'
            localStorage.setItem('x', xElement.value)
        }
    })

    form?.addEventListener('submit', (e) => {
        try {
            isPointInArea()
        } catch (errors) {
            errors.forEach((errorElement) => {
                errorElement.classList.add('_active')
            })
            e.preventDefault()
        }
    })

    let init = () => {
        if (!xElement || !yElement || !radiusElement) return
        xElement.value = localStorage.getItem('x')
        yElement.value = localStorage.getItem('y')
        radiusElement.value = localStorage.getItem('radius')
    }

    init()
    initPoints()

})
