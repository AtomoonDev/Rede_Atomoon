import { createContext, useEffect, useState } from 'react'
import { setCookie, parseCookies } from 'nookies'
import Router from 'next/router'

import { api } from '@/@core/infra/api'

type User = {
    name: string
    email: string
    avatar_url: string
}

type signInData = {
    email: string
    password: string
}

type AuthContextType = {
    isAuthenticated: boolean
    user: User | null
    signIn: (data: signInData) => Promise<void>
}

export const AuthContext = createContext({} as AuthContextType)

export function AuthProvider({ children }) {
    const [user, setUser] = useState<User | null>(null)

    const isAuthenticated = !!user

    useEffect(() => {
        const { 'nextpage.token': token } = parseCookies()

        if (token) {
            setUser({} as User)
            //recoverUserInformation().then(response => setUser(response.user))
        }
    }, [])

    async function signIn({ email, password }: signInData) { 
        /*const { token, user } = await signInRequest({
            email,
            password
        })*/

        const token = 'token'
        const user = {
            name: 'name',
            email: 'email',
            avatar_url: 'avatar_url'
        }

        setCookie(undefined, 'nextpage.token', token, {
            maxAge: 60 * 60 * 1 // 1 hour
        })

        api.defaults.headers['Authorization'] = `Bearer ${token}`

        setUser(user)

        Router.push('/')
    }

    return (
        <AuthContext.Provider value={{ user, isAuthenticated, signIn }}>
            {children}
        </AuthContext.Provider>
    )
}