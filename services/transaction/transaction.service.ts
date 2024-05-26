import { client } from "@/lib/client";
import { TransactionResponse, TransactionType } from "./types/response.type";
import { configApp } from "@/utils/config-app";
import { CreateTransactionDto } from "./dto/create-transaction.dto";
import { BaseResponseType } from "../base-response.type";


export default class TransactionService {

    static async getAll(): Promise<TransactionType[]> {
        return await client<TransactionType[]>(`${configApp.api.baseUrl}/transactions/all`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            }
        }).then((res) => res).catch((err) => err)
    }


    static async create(data: CreateTransactionDto): Promise<TransactionType> {
        return await client<TransactionType>(`${configApp.api.baseUrl}/transactions/create`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            },
            data
        }).then((res) => res).catch((err) => err)
    }

    // delete user 
    static async delete(id: number): Promise<boolean> {
        return await client<boolean>(`${configApp.api.baseUrl}/transactions/delete/${id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            },
        }).then((res) => res).catch((err) => err)
    }


    // update transaction
    static async update(id : number, data: CreateTransactionDto): Promise<TransactionType> {
        return await client<TransactionType>(`${configApp.api.baseUrl}/transactions/update/${id}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            },
            data
        }).then((res) => res).catch((err) => err)
    }
}