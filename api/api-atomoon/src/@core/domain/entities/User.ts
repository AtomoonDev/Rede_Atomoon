export type UserProps = {
    id: string
    name: string
    email: string
    password: string
    role: 'user' | 'admin'
    createdAt: Date
    updatedAt?: Date
}

export type UserPropsInput = Omit<UserProps, 'id' | 'createdAt' | 'updatedAt'>
export type UserPropsOutput = Omit<UserProps, 'id' | 'password' | 'updatedAt'>

export class User {
    constructor(public props: UserProps) { }

    get id() {
        return this.props.id
    }

    get name() {
        return this.props.name
    }

    get email() {
        return this.props.email
    }

    get password() {
        return this.props.password
    }

    get role() {
        return this.props.role
    }

    get createdAt() {
        return this.props.createdAt
    }

    get updatedAt() {
        return this.props.updatedAt
    }

    toJSON() {
        return {
            id: this.id,
            name: this.name,
            email: this.email,
            password: this.password,
            role: this.role,
            createdAt: this.createdAt,
            updatedAt: this.updatedAt
        }
    }
}