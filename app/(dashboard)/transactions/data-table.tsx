'use client'
import React from 'react'
import {
    DropdownMenu,
    DropdownMenuCheckboxItem,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { MoreHorizontal, SquarePen, Trash2 } from "lucide-react"
import Image from "next/image"
import TransactionService from '@/services/transaction/transaction.service'
import { useQuery } from 'react-query'
import { DrawerDialogCreateUser } from '@/shared/transaction/create-edit-transaction/create-edit-transaction'
import { transactionStore } from '@/store/transaction/transaction.store'
import toast from 'react-hot-toast'
import { formatDate } from '@/utils/format-date'
import { EditTransaction } from '@/shared/transaction/edit-transaction/edit-transaction'
export default function DataTable() {
    const useCustomerStore = transactionStore()
    const { data } = useQuery({
        queryKey: ["transactions"],
        queryFn: async () => {
            const response = await TransactionService.getAll().then((res) => res)
            useCustomerStore.initCusomer(response)
            return response
        },
    })

    const deleteTransaction = async (id: number) => {
        console.log(id)
        const response = await TransactionService.delete(id)
        if (response) {
            toast.success('Transaction supprimé')
            useCustomerStore.removeCustomer(id)
        } else {
            toast.error('Une erreur est survenue')
        }
    }
    return (
        <Card x-chunk="dashboard-06-chunk-0" className="h-full">
            <CardHeader>
                <CardTitle className='flex justify-between flex-col md:flex-row space-y-2'>
                    <p>Liste des transaction</p>
                    <DrawerDialogCreateUser>
                        <Button>Ajouter une transaction</Button>
                    </DrawerDialogCreateUser>
                </CardTitle>
                <CardDescription>
                    Gérez vos transaction
                </CardDescription>
            </CardHeader>
            <CardContent>
                <Table>
                    <TableHeader>
                        <TableRow>
                            {/* <TableHead className="hidden w-[100px] sm:table-cell">
                                <span className="sr-only">Image</span>
                            </TableHead> */}
                            <TableHead>Descritpion</TableHead>
                            <TableHead>Montant</TableHead>
                            <TableHead>Type</TableHead>
                            <TableHead>Date de transaction</TableHead>
                            <TableHead>
                                <span className="sr-only">Actions</span>
                            </TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {
                            useCustomerStore.transactions &&  useCustomerStore.transactions?.map((transaction) => (
                                <TableRow key={transaction.id}>
                                    {/* <TableCell className="hidden sm:table-cell">
                                        <Image
                                            alt="Product image"
                                            className="aspect-square rounded-md object-cover"
                                            height="64"
                                            src={`https://api.dicebear.com/7.x/open-peeps/svg?seed=${transaction.type}`}
                                            width="64"
                                        />
                                    </TableCell> */}
                                    <TableCell className="font-medium">
                                        {transaction.description}
                                    </TableCell>
                                    <TableCell className="font-medium">
                                        {transaction.amount}
                                    </TableCell>
                                    <TableCell>
                                        <Badge variant="outline">{transaction.type}</Badge>
                                    </TableCell>
                                    <TableCell className="hidden md:table-cell">
                                        {formatDate(transaction.created_at)}
                                    </TableCell>
                                    <TableCell>
                                        <div className='flex space-x-6'>
                                            <DrawerDialogCreateUser transaction={transaction}>
                                                <SquarePen className='cursor-pointer' />
                                            </DrawerDialogCreateUser>
                                            <Trash2 color='red' className='cursor-pointer' onClick={() => deleteTransaction(transaction.id)} />
                                        </div>
                                        {/* <DropdownMenu>
                                            <DropdownMenuTrigger asChild>
                                                <Button
                                                    aria-haspopup="true"
                                                    size="icon"
                                                    variant="ghost"
                                                >
                                                    <MoreHorizontal className="h-4 w-4" />
                                                    <span className="sr-only">Toggle menu</span>
                                                </Button>
                                            </DropdownMenuTrigger>
                                            <DropdownMenuContent align="end">
                                                <DropdownMenuLabel>Actions</DropdownMenuLabel>
                                                <DropdownMenuItem>
                                                    <EditTransaction>
                                                        Modifier
                                                    </EditTransaction>
                                                </DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => deleteTransaction(transaction.id)}>Supprimer</DropdownMenuItem>
                                            </DropdownMenuContent>
                                        </DropdownMenu> */}
                                    </TableCell>
                                </TableRow>
                            ))
                        }
                    </TableBody>
                </Table>
            </CardContent>
            <CardFooter>
                <div className="text-xs text-muted-foreground">
                    Showing <strong>1-10</strong> of <strong>32</strong>{" "}
                    products
                </div>
            </CardFooter>
        </Card>
    )
}
