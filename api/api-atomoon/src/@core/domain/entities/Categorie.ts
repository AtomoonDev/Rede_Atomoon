export type CategorieProps = {
    id: number
    name: string
    description: string
}

export class Categorie {
    constructor(public props: CategorieProps) {}

    get id() {
        return this.props.id
    }

    get name() {
        return this.props.name
    }

    get description() {
        return this.props.description
    }

    toJSON(){
        return {
            id: this.id,
            name: this.name,
            description: this.description
        }
    }
}