import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Ffni from '@/components/Ffni'
import Ffnis from '@/components/Ffnis'
import Guide from '@/components/Guide'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/ffni',
      name: 'Ffni',
      component: Ffni
    },
    {
      path: '/ffnis',
      name: 'Ffnis',
      component: Ffnis
    },
    {
      path: '/guide',
      name: 'Guide',
      component: Guide
    }
  ]
})
