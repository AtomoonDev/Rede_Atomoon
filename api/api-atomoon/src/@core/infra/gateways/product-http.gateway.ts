
import { AxiosInstance } from "axios";
import { Product } from "../../domain/entities/Product";
import { ProductGateway } from "../../domain/gateways/product.gateway";

export class ProductAxiosGateway implements ProductGateway {
    constructor(public api: AxiosInstance) { }

    async findAll(): Promise<Product[]> {
        return this.api.get<Product[]>('/products').then(
            (res) =>
                res.data.map(data =>
                    new Product({
                        id: data.id,
                        name: data.name,
                        description: data.description,
                        price: data.price
                    })
                )
        )
    }

    async findById(id: string): Promise<Product> {
        return this.api.get<Product>(`/products/${id}`).then(res => {
            return new Product({
                id: res.data.id,
                name: res.data.name,
                description: res.data.description,
                price: res.data.price
            })
        })
    }
}