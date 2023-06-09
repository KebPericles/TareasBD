// @ts-nocheck
export const MYSQL_TIPO = {
        /**
         * 
         * @param {String} campo 
         */
        string: (campo) => {
                return '\'' + (campo ? campo : '') + '\'';
        },
        /**
         * @param {Number} campo 
         */
        Number: (campo) => {
                return campo.toString();
        },
        /**
         * 
         * @param {Boolean} campo 
         */
        Boolean: (campo) => {
                return campo ? 'TRUE' : 'FALSE';
        },
        /**
         * 
         * @param {String} campo 
         */
        Date: (campo) => {
                if (!campo || campo.length === 0) return null;
                campo = new Date(campo);
                // MySQL Datetime format: 'YYYY-MM-DD hh:mm:ss'
                if (campo.getMilliseconds() === 1)
                        return `${campo.getFullYear()}-${campo.getMonth()}-${campo.getDate()}`;

                return `${campo.getFullYear()}-${campo.getMonth()}-${campo.getDate()} ${campo.getHours()}:${campo.getMinutes()}:${campo.getSeconds()}`;
        },
}

export const MYSQL_STATUS = {
        SUCCESS: 1,
        FAILURE: 0,
        WAITING: -1
}

/**
 * 
 * @param {*} campo 
 * @returns {String}
 */
export const acondicionar = (campo, tipo = typeof '') => {
        return MYSQL_TIPO[tipo](campo);
}