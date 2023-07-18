import { Product } from "../../../domain/entities"
import { ProductGateway } from "../../../domain/gateways"

export default class GetProductUseCase {
    constructor(private productGateway: ProductGateway) { }

    execute(id: string): Promise<Product> {
        return this.productGateway.findById(id)
    }
}