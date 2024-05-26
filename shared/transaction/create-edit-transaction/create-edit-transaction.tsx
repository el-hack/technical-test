import * as React from "react"

import { cn } from "@/lib/utils"
import { useMediaQuery } from 'usehooks-ts'
import { Button } from "@/components/ui/button"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import {
    Drawer,
    DrawerClose,
    DrawerContent,
    DrawerDescription,
    DrawerFooter,
    DrawerHeader,
    DrawerTitle,
    DrawerTrigger,
} from "@/components/ui/drawer"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Controller, useForm } from "react-hook-form"
import { CreateTransactionDto } from "@/services/transaction/dto/create-transaction.dto"
import { z } from "zod"
import { zodResolver } from "@hookform/resolvers/zod"
import TransactionService from "@/services/transaction/transaction.service"
import toast from "react-hot-toast"
import { RotateCcw } from "lucide-react"
import { Alert } from "@/components/ui/alert"
import { useState } from "react"
import { transactionStore } from "@/store/transaction/transaction.store"
import { TransactionType } from "@/services/transaction/types/response.type"

export function DrawerDialogCreateUser({ children, transaction }: { children: React.ReactNode, transaction?: TransactionType }) {
    const [open, setOpen] = React.useState(false)
    const isDesktop = useMediaQuery("(min-width: 768px)")



    if (isDesktop) {
        return (
            <Dialog open={open} onOpenChange={setOpen}>
                <DialogTrigger asChild>
                    {children}
                </DialogTrigger>
                <DialogContent className="sm:max-w-[425px]">
                    <DialogHeader>
                        <DialogTitle>Ajouter une transaction</DialogTitle>
                        <DialogDescription>
                            Ajoutez une transaction a votre base de donnée
                        </DialogDescription>
                    </DialogHeader>
                    <CreateUserForm values={transaction} setOpen={setOpen} className="" />
                </DialogContent>
            </Dialog>
        )
    }

    return (
        <Drawer open={open} onOpenChange={setOpen}>
            <DrawerTrigger asChild>
                {children}
            </DrawerTrigger>
            <DrawerContent>
                <DrawerHeader className="text-left">
                    <DrawerTitle>Ajouter une transaction</DrawerTitle>
                    <DrawerDescription>
                        Ajoutez une transaction a votre base de donnée
                    </DrawerDescription>
                </DrawerHeader>
                <CreateUserForm className="px-4" setOpen={setOpen} />
                <DrawerFooter className="pt-2">
                    <DrawerClose asChild>
                        <Button variant="outline">Cancel</Button>
                    </DrawerClose>
                </DrawerFooter>
            </DrawerContent>
        </Drawer>
    )
}

function CreateUserForm({ className, setOpen, values}: { className: string, setOpen: React.Dispatch<React.SetStateAction<boolean>>, values?: TransactionType }) {
    const [response, setResponse] = useState('')
    const useTransactionStore = transactionStore()
    // zod validation with useForm
    const defaultValues: CreateTransactionDto = {
        amount: values?.amount ?? 0,
        description: values?.description ?? "",
        type: values?.type ?? "",
    }

    const schema = z.object({
        amount: z.string(),
        description: z.string({ message: 'Description doit être une chaine de caractère' }),
        type: z.string(),
    })

    const {
        register,
        handleSubmit,
        control,
        setError,
        formState: { errors, isSubmitting },
    } = useForm<CreateTransactionDto>({
        defaultValues,
        resolver: zodResolver(schema),
    });

    async function onSubmit(data: CreateTransactionDto) {
        if (values) {
            await TransactionService.update(values!.id, data).then((res) => {
                if (res) {
                    toast.success("Transaction mis à jour")
                    useTransactionStore.updateCustomer(values!.id, res)
                    setOpen(false)
                } else {
                    toast.error("Une erreur est survenue")
                }
            }).catch((err) => {
                toast.error("Une erreur est survenue")
            })

            return
        }
        await TransactionService.create(data).then((res) => {
            toast.success("Transaction ajouté avec succès")
            useTransactionStore.addCustomer(res)
            setOpen(false)
        }).catch((err) => {
            console.log(err)
        })
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} className={cn("grid items-start gap-4", className)}>
            <Controller
                control={control}
                name="amount"
                render={({ field }) => (
                    <div className="grid gap-2">
                        <Label htmlFor="amount">Montant</Label>
                        <Input
                            type="number"
                            id="amount"
                            {...field}
                        />
                        {errors.amount && <p className="text-red-500 text-sm">{errors.amount.message}</p>}
                    </div>
                )}
            />
            <Controller
                control={control}
                name="description"
                render={({ field }) => (
                    <div className="grid gap-2">
                        <Label htmlFor="description">Description</Label>
                        <Input id="description" defaultValue="@shadcn"
                            {...field}
                        />
                        {errors.description && <p className="text-red-500 text-sm">{errors.description.message}</p>}

                    </div>
                )}
            />
            <Controller
                control={control}
                name="type"
                render={({ field }) => (
                    <div className="grid gap-2">
                        <Label htmlFor="type">Type</Label>
                        <Input id="type" defaultValue="@shadcn"
                            {...field}
                        />
                        {errors.type && <p className="text-red-500 text-sm">{errors.type.message}</p>}

                    </div>
                )}
            />
            {response ?? <Alert>{response}</Alert>}
            <Button type="submit" disabled={isSubmitting}>
                {isSubmitting ? <RotateCcw size={16} /> : null}
                Enregistrer</Button>
        </form>
    )
}
