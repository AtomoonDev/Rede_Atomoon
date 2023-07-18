import { Product } from "./Product"

export type CartProps = {
    products: Product[]
}

export class Cart {
    constructor(public props: CartProps) { }

    addProduct(product: Product) {
        this.props.products.push(product)
    }

    removeProduct(productId: number) {
        this.props.products = this.props.products.filter(
            (product) => product.id !== productId
        )
    }

    clear() {
        this.props.products = []
    }

    get total() {
        return this.props.products.reduce((total, product) => total + product.props.price, 0)
    }

    get product() {
        return this.props.products
    }
}