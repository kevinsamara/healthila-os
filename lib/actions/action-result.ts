export type ActionResult<T = unknown> = {
  success: boolean;
  data?: T;
  message?: string;
};
