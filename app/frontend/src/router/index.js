import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Blog from '@/components/Blog'
import Login from '@/components/Login'
import Investing from '@/components/Investing'
import Performance from '@/components/info/Performance'
import Portfolio from '@/components/info/Portfolio'
import Allocation from '@/components/info/Allocation'
import Community from '@/components/info/Community'
import Trading from '@/components/manager/Trading'
import Voting from '@/components/voting/Voting'
import Setting from '@/components/setting/Setting'
import Governance from '@/components/setting/Governance'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/blog',
      name: 'Blog',
      component: Blog
    },
    {
      path: '/investing',
      name: 'Investing',
      component: Investing,
      children: [
        {
          path: 'performance',
          component: Performance
        },
        {
          path: 'portfolio',
          component: Portfolio
        },
        {
          path: 'allocation',
          component: Allocation
        },
        {
          path: 'community',
          component: Community
        },
        {
          path: 'trading',
          component: Trading
        },
        {
          path: 'voting',
          component: Voting
        },
        {
          path: 'setting',
          component: Setting
        },
        {
          path: 'governance',
          component: Governance
        }
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }
  ]
})
