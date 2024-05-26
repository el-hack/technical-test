import { TransactionType } from "@/services/transaction/types/response.type";
import { create } from "zustand";

type CustomerStoreType = {
    transactions: TransactionType[];
    token: any;
    setToken: (token: any) => void;
    initCusomer: (transactions: TransactionType[]) => void;
    addCustomer: (transaction: TransactionType) => void;
    updateCustomer: (id: number, data: TransactionType) => void;
    removeCustomer: (id: number) => void;
}

export const transactionStore = create<CustomerStoreType>((set) => ({
    transactions: [],
    token: null,
    setToken: (token: any) => set({ token }),
    initCusomer: (transactions: TransactionType[]) => set({ transactions: transactions }),
    addCustomer: (transaction: TransactionType) => set((state) => ({ transactions: [...state.transactions, transaction] })),
    removeCustomer: (id: number) => set((state) => {
        return {
            transactions: state.transactions.filter((transaction) => transaction.id !== id)
        }
    }),
    updateCustomer: (id: number, data: TransactionType) => set((state) => {
        return {
            transactions: state.transactions.map((transaction) => transaction.id === id ? data : transaction)
        }
    }),
}));    
