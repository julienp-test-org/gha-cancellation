import * as pulumi from "@pulumi/pulumi";

export const x = new Promise(resolve => setTimeout(() => { resolve("banana") }, 5 * 60 * 1000))
