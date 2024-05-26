// import { Injectable } from "@nestjs/common";
// import User from "src/core/domain/entities/user.entity";

// @Injectable()
// export class LoginUserUseCase {
//     constructor(private jwtService: JwtService) { }

//     async execute(user: User) {
//         const payload = { email: user.email, sub: user.id };
//         return {
//             access_token: this.jwtService.sign(payload),
//         };
//     }
// }