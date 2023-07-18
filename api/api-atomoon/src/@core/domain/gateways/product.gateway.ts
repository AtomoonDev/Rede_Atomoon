import { Product } from "../entities/Product"

export interface ProductGateway {
    findAll(): Promise<Product[]>
    findById(id: string): Promise<Product>
}