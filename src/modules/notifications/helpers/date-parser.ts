export const dateParser = (date: string):string => {

    const newDate = new Date(date)
    const day:string = newDate.getDay() < 10 ? '0'+newDate.getDay() : `${newDate.getDay()}`
    const month:string = newDate.getMonth() < 10 ? '0'+newDate.getMonth() : `${newDate.getMonth()}`

    return `${day}-${month}-${newDate.getFullYear()}`
}