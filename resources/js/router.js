import VueRouter from 'vue-router'

// components
import Home from './components/Home'
import Register from './components/Register'
import Login from './components/Login'
import Dashboard from './components/Dashboard'
import AdminDashboard from './components/Admin'
import CreateProp from './components/CreateProp'
import Browse from './components/Browse'
import View from './components/View'

// Routes
const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      auth: undefined
    }
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: {
      auth: false
    }
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      auth: false
    }
  },
  // USER ROUTES
  {
    path: '/dashboard',
    name: 'dashboard',
    component: Dashboard,
    meta: {
      auth: true
    }
  },
  {
    path: '/create',
    name: 'create',
    component: CreateProp,
    meta: {
      auth: true
    }
  },
  {
    path: '/browse',
    name: 'browse',
    component: Browse,
    meta: {
      auth: undefined
    }
  },
  {
    path: '/view/:id',
    name: 'view',
    component: View,
    meta: {
      auth: undefined
    }
  },
  // ADMIN ROUTES
  {
    path: '/admin',
    name: 'admin',
    component: AdminDashboard,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'}
    }
  },
]

const router = new VueRouter({
  history: true,
  mode: 'history',
  routes,
})

export default router
