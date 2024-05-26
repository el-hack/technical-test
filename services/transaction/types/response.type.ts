import * as z from "zod";


export const TransactionTypeSchema = z.object({
    "id": z.number(),
    "amount" : z.number(),
    "description": z.string(),
    "type": z.string(),
    "created_at": z.coerce.date(),
});

export const TransactionResponseSchema = z.object({
    "status": z.boolean(),
    "message": z.string(),
    "data": z.array(TransactionTypeSchema),
});

export type TransactionType = z.infer<typeof TransactionTypeSchema>;
export type TransactionResponse = z.infer<typeof TransactionResponseSchema>;
