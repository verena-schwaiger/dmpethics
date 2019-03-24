import Vue from 'vue'
import Router from 'vue-router'
import Questionnaire from '@/components/Questionnaire'
import Answers from '@/components/Answers'
import Studies from '@/components/Studies'
import User from '@/components/User'
import Main from '@/components/Main'

Vue.use(Router)

export default new Router ({
    mode: 'history',
 routes: [
  {
    path: '/',
    name: 'Home',
    component: Main
  },
  {
    path: '/questionnaire',
    name: 'Questionnaire',
    component: Questionnaire
  },
  {                         
    path: '/answers',
    name: 'Answers',
    component: Answers
   },
   {
     path: '/user',
     name: 'User',
     component: User
   },
  {
    path: '/studies',
    name: 'Studies',
    component: Studies
  }
   
  ]
})