
import type { Actions, PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({request, params}) => {
        console.log(params);
        return {success: true}
};

export const actions: Actions = {
        default: async ({request, locals})=>{
                
                let form = Object.fromEntries(await request.formData())
                console.log(form);
                
                return {
                        test: form.test
                }
        }
};