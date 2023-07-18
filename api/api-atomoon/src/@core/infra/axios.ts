import axios from 'axios'
import { parseCookies } from 'nookies'

export const getAPIClient = (ctx?: any) => {
    const api = axios.create({
        baseURL: 'http://localhost:3000'
    })

    // Debug requests
    api.interceptors.request.use(config => {
        console.log(config)
    
        return config
    })

    // Authentication
    const { 'nextauth.token': token } = parseCookies(ctx)

    if (token) {
        api.defaults.headers.common['Authorization'] = `Bearer ${token}`
    }

    return api
}