import Vue from 'vue/dist/vue.esm'
import Questionnaire from '../Questionnaire.vue'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#questionnaire',
        components: { Questionnaire },
        template: '<Questionnaire/>'
    })
})